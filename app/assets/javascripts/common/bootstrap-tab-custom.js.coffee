$('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
  $('.nav-tabs-custom > .tab-content > .tab-pane.active').fadeOut();
  $('.nav-tabs-custom > .tab-content > .tab-loader').fadeIn();

  $.ajax
    type: 'GET'
    url: $(e.target).attr('data-url')
    success: (data) ->
      $('.nav-tabs-custom > .tab-content > .tab-pane.active').html data
      $('.nav-tabs-custom > .tab-content > .tab-loader').fadeOut();
      $('.nav-tabs-custom > .tab-content > .tab-pane.active').fadeIn();
      $('[data-toggle="popover"]').popover(placement: 'auto', container: 'body');
      return
    error: (data) ->
      console.log('Error: ', data);
      return
  return

$('a[data-toggle="tab"]').first().click();
