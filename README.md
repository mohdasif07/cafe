# Cozy Cafe

Premium café website for **Cozy Cafe** (Cadillac, MI), built with Ruby on Rails, HTML, CSS, and JavaScript.

## Business

- **Name:** Cozy Cafe
- **Address:** 8834 E 34 Rd, Cadillac, MI 49601, USA
- **Phone:** +1 (568) 828-9017

## Setup

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Or run the server and Sass watcher separately:

```bash
bin/rails dartsass:watch   # terminal 1
bin/rails server           # terminal 2
```

Visit [http://localhost:3000](http://localhost:3000)

## Pages

| Path | Page |
|------|------|
| `/` | Home |
| `/about` | About |
| `/menu` | Menu |
| `/gallery` | Gallery |
| `/contact` | Contact |
| `/privacy` | Privacy Policy (placeholder) |
| `/terms` | Terms & Conditions (placeholder) |

## Stack

- Ruby on Rails 8
- ERB views
- Dart Sass
- Stimulus + Importmap
- Vanilla JS behaviors (nav, reveal, lightbox, menu tabs, form validation)
# cafe
