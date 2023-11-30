function run_tests_for_day() {
  DAY=$1

  jqunit --libraries * --module "day_${DAY}_test"

  if [[ $? -ne 0 ]]; then
    exit 1
  fi

}