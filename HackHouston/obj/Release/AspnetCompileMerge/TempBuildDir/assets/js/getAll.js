$.getScript(window.city_config['api url'] + '/get/all?hash=' + hashData() + '&callback=jsonpCallback', function () {
    $('#fees').html(''); // clear old data
    _Handler.removeAll(); // clear old handlers
    handler.initAll();
    window.fee_filter = create_filter(master_fees);
    $.waypoints('refresh');
});