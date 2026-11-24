resource "lab" "l2ct" {
  title       = "hp-var"
  description = "l2ct-tasks fixture hp-var. Generated; do not edit by hand."
  layout      = resource.layout.main
  settings {
    timelimit {
      duration = "45m"
      extend   = "5m"
    }
  }
  content {
    chapter "main" {
      title = "Tasks"
      page "p01" {
        title     = "Step 1"
        reference = resource.page.p01
      }
      page "p02" {
        title     = "Step 2"
        reference = resource.page.p02
      }
      page "p03" {
        title     = "Step 3"
        reference = resource.page.p03
      }
      page "p04" {
        title     = "Step 4"
        reference = resource.page.p04
      }
      page "p05" {
        title     = "Step 5"
        reference = resource.page.p05
      }
      page "p06" {
        title     = "Step 6"
        reference = resource.page.p06
      }
      page "p07" {
        title     = "Step 7"
        reference = resource.page.p07
      }
      page "p08" {
        title     = "Step 8"
        reference = resource.page.p08
      }
      page "p09" {
        title     = "Step 9"
        reference = resource.page.p09
      }
      page "p10" {
        title     = "Step 10"
        reference = resource.page.p10
      }
      page "p11" {
        title     = "Step 11"
        reference = resource.page.p11
      }
      page "p12" {
        title     = "Step 12"
        reference = resource.page.p12
      }
      page "p13" {
        title     = "Step 13"
        reference = resource.page.p13
      }
      page "p14" {
        title     = "Step 14"
        reference = resource.page.p14
      }
      page "p15" {
        title     = "Step 15"
        reference = resource.page.p15
      }
      page "p16" {
        title     = "Step 16"
        reference = resource.page.p16
      }
      page "p17" {
        title     = "Step 17"
        reference = resource.page.p17
      }
      page "p18" {
        title     = "Step 18"
        reference = resource.page.p18
      }
      page "p19" {
        title     = "Step 19"
        reference = resource.page.p19
      }
      page "p20" {
        title     = "Step 20"
        reference = resource.page.p20
      }
      page "p21" {
        title     = "Step 21"
        reference = resource.page.p21
      }
      page "p22" {
        title     = "Step 22"
        reference = resource.page.p22
      }
      page "p23" {
        title     = "Step 23"
        reference = resource.page.p23
      }
      page "p24" {
        title     = "Step 24"
        reference = resource.page.p24
      }
      page "p25" {
        title     = "Step 25"
        reference = resource.page.p25
      }
      page "p26" {
        title     = "Step 26"
        reference = resource.page.p26
      }
      page "p27" {
        title     = "Step 27"
        reference = resource.page.p27
      }
      page "p28" {
        title     = "Step 28"
        reference = resource.page.p28
      }
      page "p29" {
        title     = "Step 29"
        reference = resource.page.p29
      }
    }
  }
}

resource "layout" "main" {
  column {
    width = "50"
    instructions {}
  }
  column {
    width = "50"
    tab "terminal" {
      title  = "Terminal"
      target = resource.terminal.shell
    }
  }
}

resource "terminal" "shell" {
  target = resource.container.c1
}

resource "network" "net" {
  subnet = "10.0.0.0/24"
}

resource "container" "c1" {
  image {
    name = "ubuntu:24.04"
  }
  network {
    id = resource.network.net.meta.id
  }
}

resource "page" "p01" {
  title = "Step 1"
  file  = "instructions/p01.md"
  activities = {
    t01 = resource.task.h02v1
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h02v2
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.h02v3
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.h02v4
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.h02v5
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.h09v1
  }
}

resource "page" "p07" {
  title = "Step 7"
  file  = "instructions/p07.md"
  activities = {
    t07 = resource.task.h09v2
  }
}

resource "page" "p08" {
  title = "Step 8"
  file  = "instructions/p08.md"
  activities = {
    t08 = resource.task.h09v3
  }
}

resource "page" "p09" {
  title = "Step 9"
  file  = "instructions/p09.md"
  activities = {
    t09 = resource.task.h09v4
  }
}

resource "page" "p10" {
  title = "Step 10"
  file  = "instructions/p10.md"
  activities = {
    t10 = resource.task.h09v5
  }
}

resource "page" "p11" {
  title = "Step 11"
  file  = "instructions/p11.md"
  activities = {
    t11 = resource.task.h15v1
  }
}

resource "page" "p12" {
  title = "Step 12"
  file  = "instructions/p12.md"
  activities = {
    t12 = resource.task.h15v2
  }
}

resource "page" "p13" {
  title = "Step 13"
  file  = "instructions/p13.md"
  activities = {
    t13 = resource.task.h15v3
  }
}

resource "page" "p14" {
  title = "Step 14"
  file  = "instructions/p14.md"
  activities = {
    t14 = resource.task.h15v4
  }
}

resource "page" "p15" {
  title = "Step 15"
  file  = "instructions/p15.md"
  activities = {
    t15 = resource.task.r16v1
  }
}

resource "page" "p16" {
  title = "Step 16"
  file  = "instructions/p16.md"
  activities = {
    t16 = resource.task.r16v1r
  }
}

resource "page" "p17" {
  title = "Step 17"
  file  = "instructions/p17.md"
  activities = {
    t17 = resource.task.r16v2
  }
}

resource "page" "p18" {
  title = "Step 18"
  file  = "instructions/p18.md"
  activities = {
    t18 = resource.task.r16v2r
  }
}

resource "page" "p19" {
  title = "Step 19"
  file  = "instructions/p19.md"
  activities = {
    t19 = resource.task.r16v3
  }
}

resource "page" "p20" {
  title = "Step 20"
  file  = "instructions/p20.md"
  activities = {
    t20 = resource.task.r16v3r
  }
}

resource "page" "p21" {
  title = "Step 21"
  file  = "instructions/p21.md"
  activities = {
    t21 = resource.task.r16v4
  }
}

resource "page" "p22" {
  title = "Step 22"
  file  = "instructions/p22.md"
  activities = {
    t22 = resource.task.r16v4r
  }
}

resource "page" "p23" {
  title = "Step 23"
  file  = "instructions/p23.md"
  activities = {
    t23 = resource.task.h05v1
  }
}

resource "page" "p24" {
  title = "Step 24"
  file  = "instructions/p24.md"
  activities = {
    t24 = resource.task.h05v2
  }
}

resource "page" "p25" {
  title = "Step 25"
  file  = "instructions/p25.md"
  activities = {
    t25 = resource.task.h05v3
  }
}

resource "page" "p26" {
  title = "Step 26"
  file  = "instructions/p26.md"
  activities = {
    t26 = resource.task.h05v4
  }
}

resource "page" "p27" {
  title = "Step 27"
  file  = "instructions/p27.md"
  activities = {
    t27 = resource.task.f05v1
  }
}

resource "page" "p28" {
  title = "Step 28"
  file  = "instructions/p28.md"
  activities = {
    t28 = resource.task.f05v2
  }
}

resource "page" "p29" {
  title = "Step 29"
  file  = "instructions/p29.md"
  activities = {
    t29 = resource.task.f05v4
  }
}

resource "task" "h02v1" {
  description = "H02.v1 Check then Skip, 0 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "3 s check"
    check {
      script = "scripts/sleep3_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h02v2" {
  description = "H02.v2 Check then Skip, 50 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "3 s check"
    check {
      script = "scripts/sleep3_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h02v3" {
  description = "H02.v3 Check then Skip, 150 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "3 s check"
    check {
      script = "scripts/sleep3_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h02v4" {
  description = "H02.v4 Check then Skip, 300 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "3 s check"
    check {
      script = "scripts/sleep3_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h02v5" {
  description = "H02.v5 Check then Skip, 500 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "3 s check"
    check {
      script = "scripts/sleep3_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h09v1" {
  description = "H09.v1 10 s check, offline for 1 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h09v2" {
  description = "H09.v2 10 s check, offline for 3 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h09v3" {
  description = "H09.v3 10 s check, offline for 8 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h09v4" {
  description = "H09.v4 10 s check, offline for 12 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h09v5" {
  description = "H09.v5 10 s check, offline for 20 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15v1" {
  description = "H15.v1 check prints 1 MB"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "1 MB"
    check {
      script = "scripts/h15_1mb.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15v2" {
  description = "H15.v2 check prints 5 MB"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "5 MB"
    check {
      script = "scripts/h15_5mb.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15v3" {
  description = "H15.v3 check prints 20 MB"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "20 MB"
    check {
      script = "scripts/h15_20mb.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15v4" {
  description = "H15.v4 check prints 50 MB"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "50 MB"
    check {
      script = "scripts/h15_50mb.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "r16v1" {
  description = "R16.v1 double click, 0 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/r16v1_slow_fail.sh"
      failure_message = "R16 first task failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "r16v1r" {
  description = "R16.v1 counts the check runs"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/r16v1_count.sh"
      failure_message = "R16: the check ran more than once"
    }
  }
}

resource "task" "r16v2" {
  description = "R16.v2 double click, 20 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/r16v2_slow_fail.sh"
      failure_message = "R16 first task failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "r16v2r" {
  description = "R16.v2 counts the check runs"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/r16v2_count.sh"
      failure_message = "R16: the check ran more than once"
    }
  }
}

resource "task" "r16v3" {
  description = "R16.v3 double click, 40 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/r16v3_slow_fail.sh"
      failure_message = "R16 first task failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "r16v3r" {
  description = "R16.v3 counts the check runs"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/r16v3_count.sh"
      failure_message = "R16: the check ran more than once"
    }
  }
}

resource "task" "r16v4" {
  description = "R16.v4 double click, 80 ms apart"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/r16v4_slow_fail.sh"
      failure_message = "R16 first task failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "r16v4r" {
  description = "R16.v4 counts the check runs"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/r16v4_count.sh"
      failure_message = "R16: the check ran more than once"
    }
  }
}

resource "task" "h05v1" {
  description = "H05.v1 10 s check, refresh after 1 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h05v2" {
  description = "H05.v2 10 s check, refresh after 2 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h05v3" {
  description = "H05.v3 10 s check, refresh after 4 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h05v4" {
  description = "H05.v4 10 s check, refresh after 8 s"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "10 s check"
    check {
      script = "scripts/sleep10_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "f05v1" {
  description = "F05.v1 environment value"
  config {
    target = resource.container.c1
    environment = { L2CT_ENV = "" }
  }
  condition "c1" {
    description = "env value"
    check {
      script = "scripts/f05_env_1.sh"
      failure_message = "F05: the value was not seen"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "f05v2" {
  description = "F05.v2 environment value"
  config {
    target = resource.container.c1
    environment = { L2CT_ENV = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" }
  }
  condition "c1" {
    description = "env value"
    check {
      script = "scripts/f05_env_2.sh"
      failure_message = "F05: the value was not seen"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "f05v4" {
  description = "F05.v4 environment value"
  config {
    target = resource.container.c1
    environment = { L2CT_ENV = "héllo-日本-🙂" }
  }
  condition "c1" {
    description = "env value"
    check {
      script = "scripts/f05_env_4.sh"
      failure_message = "F05: the value was not seen"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
