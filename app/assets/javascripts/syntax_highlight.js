$(document).ready(function() {
  $('pre[data-highlight]').each(function(i, el){
    lang = $(el).data('highlight');
    try {
      $(el).snippet(lang, {style: 'golden', showNum: true});
    } catch(err){}
  });
});
