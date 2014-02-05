function jsonpCallback(object) {
  if (!object) {
    master_fees = getFees();
    return;
  }

  master_fees = object;
  storeFees(object);    
}

function hashData() {
  var data = getFees();
  if (!data) {
    return null;
  }

  return setTimeout(function () { md5(JSON.stringify(data)); },100000);
}

function storeFees(fees) {
  $.jStorage.set('fees_data', fees);
}

function getFees() {
  return $.jStorage.get('fees_data');
}
