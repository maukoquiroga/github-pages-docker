# github-pages-docker

Tracks https://pages.github.com/versions/ to provide the same version as Github Pages in production.

Triggered by any change in that page, checked at 48-hour intervals by an OnWebChange tracker.

## Usage

```sh
  docker run -it -v $(pwd):/app -p 4000:4000 morendil/github-pages
```
