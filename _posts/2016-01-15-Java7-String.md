---
layout: page
title: Java7 String Constructor Changes
---
The LiveDesign ecosystem is deployed in a variety of environments.  At a certain point we upgraded LiveDesign on a self hosted validation environment and their user level performance went to shit.  We made lots of changes between versions and now had to figure out what went wrong.

At LiveDesign we collect data on how our application is doing from a lot of different levels. According to our application the database query level had major defects, but when cross checked with database level monitoring the times didn't add up.  The database thought it was fast, the Java webapp thought it was slow.  So what was really happening?

When querying the database directly we were getting good times. I also tested querying the database via jdbc with [sqlline](https://github.com/lilleswing/sqlline), the times were likewise fine. This meant the problem had to be in our ORM layer [Hibernate](http://hibernate.org/).

After digging through the Hibernate source code we found that it was spending way too long in the following snippet.

{% highlight java %}
private void createSubselects(List keys, QueryParameters queryParameters,
                              SessionImplementor session) {
  if ( keys.size() > 1 ) {
    //if we only returned one entity, query by key is more efficient
    Set[] keySets = transpose( keys );
    Map namedParameterLocMap = buildNamedParameterLocMap( queryParameters );

    final Loadable[] loadables = getEntityPersisters();
    final String[] aliases = getAliases();
    for ( Object key : keys ) {
        final EntityKey[] rowKeys = (EntityKey[]) key;
        for ( int i = 0; i < rowKeys.length; i++ ) {
            if ( rowKeys[i] != null &&
                loadables[i].hasSubselectLoadableCollections() ) {
              SubselectFetch subselectFetch = new SubselectFetch(
                    getQueryString(),
                    aliases[i],
                    loadables[i],
                    queryParameters,
                    keySets[i],
                    namedParameterLocMap
              );
              session.getPersistenceContext()
                    .getBatchFetchQueue()
                    .addSubselect( rowKeys[i], subselectFetch);
        }
      }
    }
  }
}
public static String getQueryString(QueryParameters queryParameters) {
    final String queryString = queryParameters.getFilteredSQL();
    int fromIndex = getFromIndex(queryString);
    int orderByIndex = queryString.lastIndexOf("order by");

    return orderByIndex > 0
            ? queryString.substring(fromIndex, orderByIndex)
            : queryString.substring(fromIndex);
}
{% endhighlight %}

So why was it spending so long? In between the deploys we upgraded to Java7. Java7 reworked the String constructor to remove a possible memory leak. You can read more about it [here](http://java-performance.info/changes-to-string-java-1-7-0_06/) and [here](http://www.javaspecialists.eu/archive/Issue230.html). Instead of sharing the underlying char[] String#substring in Java7 creates a new char[]. So in Java6 getQueryString was O(1) and in Java7 it was O(n). We have really long queries in LiveDesign which exacerbated the problem.

We ended up running a [forked](https://github.com/hibernate/hibernate-orm/compare/master...schrodinger:HHH-9163) version of Hibernate until they fixed the issue.
