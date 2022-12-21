# Tech Docs Template - JS, CSS and other assets

This repo contains only the JavaScript, CSS/SASS and other assets from the [Tech Docs Gem][tdt-gem].

It's been built so that those assets can be used from frameworks other than Middleman, such as with the (experimental) [GOV.UK MkDocs theme][mkdocs-govuk].

> **Note**
> This repo is experimental, and not used by the Tech Docs Gem.
> We'll attempt to track changes over there in this repo, but no guarantees.

## Contributing

Everybody who uses this project is encouraged to contribute.

Find out how to [contribute](https://tdt-documentation.london.cloudapps.digital/support/#contribute).

## Use as part of your own website

You'll need to use these assets as part of a build pipeline in another project.

If you want to test changes to the JavaScript or CSS, you can add it as a [Git submodule][git-module]:

For example (from another `alphagov` repository)

```
git submodule add ../tech-docs-assets
npm install ./tech-docs-assets
```

Otherwise, you can install direct from Github:

```
npm install git@github.com:alphagov/tech-docs-assets.git
```

> **Warning**
> This doesn't bring in the same set of dependencies as installing via a submodule. Further investigation required.

Include the tech docs JavaScript in your website's entry point as follows:

```js
import "tech-docs-assets"
```

### Build steps

You'll need to set up workflow tasks such as:

* an SCSS step ([like this](https://github.com/alphagov/di-identity-vocab/blob/0a99feac852057d3f89c69211122db2107468c05/scripts/build#L16))
* a JavaScript bundling or transpilation step ([like this](https://github.com/alphagov/di-identity-vocab/blob/0a99feac852057d3f89c69211122db2107468c05/scripts/build#L17))
* a build step that copies images and other assets into place ([like this](https://github.com/alphagov/di-identity-vocab/blob/0a99feac852057d3f89c69211122db2107468c05/scripts/build#L19))

How you do this will depend on the web framework you're using.

> **Warning**
> JavaScript and CSS relating to full-text search is included in this module, but is completely unused/untested right now.

## Releasing new versions

We aren't packaging these assets in any way right now. When you add the package to your project as described above, your `package-lock.json` will be pinned to a specific commit. You can update using `npm update`.

### GOV.UK frontend

This module uses [GOV.UK Frontend](https://github.com/alphagov/govuk-frontend), part of the [GOV.UK Design System](https://design-system.service.gov.uk/).

We use `npm` to download the `govuk-frontend package`. To update to a new version, change the version in the [package.json file](package.json) and run `npm update`.

## Licence

Unless stated otherwise, the codebase is released under [the MIT License][mit]. This covers both the codebase and any sample code in the documentation.

The documentation is [© Crown copyright][copyright] and available under the terms of the [Open Government 3.0][ogl] licence.

[mit]: LICENCE
[copyright]: http://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/
[ogl]: http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/
[tdt-gem]: https://github.com/alphagov/tech-docs-gem
[mkdocs-govuk]: https://github.com/alphagov/mkdocs-govuk
[git-module]: https://git-scm.com/book/en/v2/Git-Tools-Submodules
