# AMONIA

Amonia a toxic sh script which aims to setup a developement
environment for most of the programming langauges and technologies,
install and configure minimal tools and applications.

**Supported operating systems**
OpenBSD, NetBSD, FreeBSD, ArchLinux(+ it derivatives),
Debian(+ it derivatives).

## What are the installed packages?

Check pkg.yml.

NB: This is more of a personal setup cause what I use isn't exactly what you do
and that's not even all, it also git clone some of my software I use and setup them
automatically

## How does it work?

**Prequisites**: install curl/wget/pget/aria2

For on the fly setup on your freshly installed OS(see supported os above), run

```bash
curl 'https://...' | sh
```

or run this instead if you want to avoid installation of my projects

```bash
curl -o setup.sh 'https://...' && 
```

One cool thing about amonia is that we just the above command 
