#= require_self
#= require jquery
#= require jquery-ui
#= require jquery_ujs
#= require bootstrap-sprockets
#= require moment
#= require bootstrap-datetimepicker
#= require cocoon
#= require adminlte/app.js
#= require adminlte/jquery.slimscroll.min.js

window.App ||= {}
App.Views ||= {}

App.init = ->
  appData = $('body').data()
  if viewName = appData['view']
    [viewsClass, viewName] = viewName.split(".")
    if appData['environment'] == 'development'
      console.log(viewsClass, viewName)
    if App.Views[viewsClass]?[viewName]?
      (window.view = new App.Views[viewsClass][viewName]).render()
    if App.Views[viewsClass]?["Common"]?
      (new App.Views[viewsClass]["Common"]).render()

  $(document).ready ->
    $(".alert").delay(5000).slideUp()
    $('input').iCheck
      checkboxClass: 'icheckbox_minimal-blue'
      radioClass: 'iradio_minimal-blue'
    return

  $('.modal').on 'loaded.bs.modal', (e)->
    $('input').iCheck
      checkboxClass: 'icheckbox_minimal-blue'
      radioClass: 'iradio_minimal-blue'
    return

  $('.modal').on 'hidden.bs.modal', (e)->
    $(".alert").addClass("fade")
    $(this).removeData('bs.modal');
    return
  return
