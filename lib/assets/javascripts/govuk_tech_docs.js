import "jquery"
import "./_vendor/modernizr.js"
import "./_vendor/fixedsticky"
import "lodash"
import "./_analytics"
import "./_start-modules"
import "./_govuk/modules.js"

const GOVUKFrontend = require('govuk-frontend')

$(function () {
  $('.fixedsticky').fixedsticky()
  GOVUKFrontend.initAll()
})