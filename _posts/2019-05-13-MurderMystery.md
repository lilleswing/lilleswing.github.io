---
layout: page
title: Murder Mystery Website
---

![overview_pic](/assets/2019_05_13/darty.jpg)

Last weekend I was in a Murder Mystery party.
The Theme was pirates.

I like participating in these events without knowing who everyone is going to be party day.
So I created a website which can hand our roles.

[github source code](https://github.com/lilleswing/murder_mystery)

```bash
# Edit scripts/assign_roles.py with male and female roles
# Put role images in static/img/{role}.png
python scripts/assign_roles.py

# Hand out passwords from static/user_passwords.csv
# Tell them to use their password on your hosted website

# Host the website somewhere
python -m http.server
```


## The Website
The website when uploaded will look something like this.

![website](/assets/2019_05_13/invite.png)

The users will put in the password from static/user_passwords.csv and get their role assignments and clues.

See it live [here](https://karlleswing.com/misc/pirates/)
