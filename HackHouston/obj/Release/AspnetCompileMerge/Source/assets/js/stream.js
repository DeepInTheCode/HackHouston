jQuery(document).ready(function($) {

  var department_template = Mustache.compile($.trim($("#department_template").html()));
  var department_container = $('#department_criteria');

  $.each(all_deps, function(i, g) {
    department_container.append(department_template({
      department: g
    }));
  });

  
  
  $('#department_criteria :checkbox').prop('checked', true);
  
  function handle() {
    $('#all_departments').on('click', function(e) {
      $('#department_criteria :checkbox:gt(0)').prop('checked', $(this).is(':checked'));
      setTimeout(function () { fee_filter.filter(); }, 100);
    });
  }
  
  handle();
  handler.addHandler(handle);
  
  //window.fee_filter = create_filter(master_fees);
});

var create_filter = function(data) {
  //data.sort(function(a, b) {
  //  var one = parseFloat(b['AMOUNT'].replace(/[^0-9.]/, ''), 10) || 0;
  //  var two = parseFloat(a['AMOUNT'].replace(/[^0-9.]/, ''), 10) || 0;
    
  //  return one - two;
  //});
  
  $.each(data, function(i, m) {
    m.id = i + 1;
    m.TagString = (typeof m.Tags != 'undefined') ? m.Tags.join(' ') : '';
  });

  window.fee_template = $.trim($("#template").html());

  var view = function(fee) {
    return Mustache.render(window.fee_template, fee);
  };
  
  var afterView = function() {
    embedBoxClick();
  }

  var callbacks = {
    show_search_count: function(result) {
      $('#total_fees').text(result.length);
    }
  };

  options = {
    filter_criteria: {
      department: ['#department_criteria input:checkbox:gt(0)', 'ResponsibleDepartment']
    },
    and_filter_on: true,
    callbacks: callbacks,
    search: {
      input: '#searchbox',
      wholeword: '#searchwholeword'
    }
    /*,
    streaming: {
      data_url: 'data/top_movies_data.json',
      stream_after: 1,
      batch_size: 50,
      before_add: function(data){
        var offset = this.data.length;

        if (offset == 450) this.clearStreamingTimer();

        for(var i = 0, l = data.length; i < l; i++)
          data[i].id = offset + i + 1;
      },
      after_add: function(data){
        var percent = (this.data.length - 250)*100/250;
        $('#stream_progress').text(percent + '%').attr('style', 'width: '+ percent +'%;');
        if (percent == 100) $('#stream_progress').parent().fadeOut(1000);
      }
    }*/
  };

  return FilterJS(data, "#fees", view, options, afterView);
}