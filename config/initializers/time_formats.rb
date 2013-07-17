# Add commonly used time format here. Usage: time_object.to_s(:am_pm) or :short_name, or etc. -H
my_formats = {
  am_pm: "%l:%M %p",
  am_pm_long: "%b %e %Y, %l:%M %p",
  am_pm_long_tz: "%b %e %Y, %l:%M %p %Z",
  am_pm_noyear: "%b %e, %l:%M %p",
  am_pm_long_no_comma: "%I:%M %p %b %d (%Y)",
  twelve_hour: "%I:%M",
  just_time: "%H:%M:%S",
  short_name: "%a, %b %d, %I:%M %p",
  just_date: "%a, %b %d",
  just_date_long: "%A, %B %d",
  date_year: "%B %d, %Y",
  date_year_long: "%a, %B %d, %Y",
  db_date: "%Y-%m-%d",
  day: "%a",
  Day: "%A",
  gg: "%a %m/%d",
  sql: "%Y-%m-%d %H:%M:%S",
  no_colon: '%Y-%m-%d %H-%M-%S',
  dt_short: "%b %e %Y, %l:%M %p",
  microformat: "%FT%T%:z"
}

Date::DATE_FORMATS.merge!(my_formats)
Time::DATE_FORMATS.merge!(my_formats)
