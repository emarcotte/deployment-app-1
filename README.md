# Code/Release process:

Code:

- Fork off of develop
- Do work.
- Make PR to develop

Release:

- Check out develop
- Run `npm version [patch|minor|whatever]`
- Commit. Push + tags
- Make PR to master

