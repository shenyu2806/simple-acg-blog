
//初始化时间
const initDate = (oldDate,full) => {
  var odate = new Date(oldDate);
  var year = odate.getFullYear();
  var month = odate.getMonth() < 9 ? '0' + (odate.getMonth() + 1) : odate.getMonth() + 1;
  var date = odate.getDate() < 10 ? '0' + odate.getDate() : odate.getDate();
  var hours = odate.getHours() < 10 ? '0' + odate.getHours() : odate.getHours();
  var minutes = odate.getMinutes() < 10 ? '0' + odate.getMinutes() : odate.getMinutes();

  if (full == 'all') {
    var t = oldDate.split(" ")[0];
    return t.split('-')[0] + '年' + t.split('-')[1] + '月' + t.split('-')[2] + '日 ' + hours + '时' + minutes + '分 ';
  } else if (full == 'year') {
    return year;
  } else if (full == 'month') {
    return odate.getMonth() + 1;
  } else if (full == 'date') {
    return date;
  } else if (full == 'newDate') {
    return year + '年' + month + '月' + date + '日 ' + hours + '时' + minutes + '分 ';
  }
}



export {
        initDate//设置时间

    }
