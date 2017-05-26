---
layout: page
title: Playing Breakout with A3C
---

Not quite. The difference isn't a matter of favoring short term vs. long term gain. (That's what gamma is for.) The difference is how you estimate long term gain. There are two ways you might try to estimate the value function given the state at step i:

{% highlight python %}
V(s_i) = r_i + r_(i+1) + r_(i+2) + ... or V(s_i) = r_i + V(s_(i+1)).
{% endhighlight %}

(For simplicity I'm assuming gamma is 1.) The first one is unbiased, but has a high variance since it's a sum of many terms. The second one is much lower variance, since it only depends on one step, but it assumes you already know how to calculate the value function for the next step. But that's the quantity we're trying to learn, so all we can do is use our current estimate of it, and that introduces bias. The purpose of lambda is to interpolate between these two approximations.

As for why you get better results with lambda=0, I'd say it's because RL is super finicky and tiny changes can have big effects on the results, often not for any obvious reason. :)

[Generalized Advantage Estimation](https://arxiv.org/pdf/1506.02438.pdf) is a paper which goes more in depth about Generalized Advantage Estimation (Michael Jordan and Pieter Abbeel).

[A3C](https://arxiv.org/pdf/1602.01783.pdf)
[Pull Request](https://github.com/deepchem/deepchem/pull/568)
