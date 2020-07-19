$(document).ready(() => {
  $(".js-local-date").each(function() {
    let timeZone = moment.tz.guess(true)
    let utc_time = $(this).text()
    let local_time = moment.tz(utc_time, timeZone).format("MM/DD/YYYY")

    $(this).text(local_time)
  })

  $(".js-local-datetime").each(function() {
    let timeZone = moment.tz.guess(true)
    let utc_time = $(this).text()
    let local_time = moment.tz(utc_time, timeZone).format("MM/DD/YY hh:mm A z")

    $(this).text(local_time)
  })

  $(".js-current-local-date").each(function() {
    let timeZone = moment.tz.guess(true)
    let utc_time = moment.now()
    let local_time = moment.tz(utc_time, timeZone).format("MM/DD/YYYY")

    $(this).text(local_time)
  })

  $(".js-current-local-time").each(function() {
    let timeZone = moment.tz.guess(true)
    let utc_time = moment.now()
    let local_time = moment.tz(utc_time, timeZone).format("hh:mm A z")

    $(this).text(local_time)
  })
})