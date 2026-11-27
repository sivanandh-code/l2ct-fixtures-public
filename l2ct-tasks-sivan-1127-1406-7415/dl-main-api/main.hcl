resource "lab" "l2ct" {
  title       = "dl-main"
  description = "l2ct-tasks fixture dl-main. Generated; do not edit by hand."
  layout      = resource.layout.main
  settings {
    timelimit {
      duration = "45m"
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
        title     = "Step 7 (50 tasks)"
        reference = resource.page.p07
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
    t01 = resource.task.l110
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.l111
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.l112_req
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.l112_dep
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.l113
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.l113_read
  }
}

resource "page" "p07" {
  title = "Step 7 (50 tasks)"
  file  = "instructions/p07.md"
  activities = {
    a01 = resource.task.l114_01
    a02 = resource.task.l114_02
    a03 = resource.task.l114_03
    a04 = resource.task.l114_04
    a05 = resource.task.l114_05
    a06 = resource.task.l114_06
    a07 = resource.task.l114_07
    a08 = resource.task.l114_08
    a09 = resource.task.l114_09
    a10 = resource.task.l114_10
    a11 = resource.task.l114_11
    a12 = resource.task.l114_12
    a13 = resource.task.l114_13
    a14 = resource.task.l114_14
    a15 = resource.task.l114_15
    a16 = resource.task.l114_16
    a17 = resource.task.l114_17
    a18 = resource.task.l114_18
    a19 = resource.task.l114_19
    a20 = resource.task.l114_20
    a21 = resource.task.l114_21
    a22 = resource.task.l114_22
    a23 = resource.task.l114_23
    a24 = resource.task.l114_24
    a25 = resource.task.l114_25
    a26 = resource.task.l114_26
    a27 = resource.task.l114_27
    a28 = resource.task.l114_28
    a29 = resource.task.l114_29
    a30 = resource.task.l114_30
    a31 = resource.task.l114_31
    a32 = resource.task.l114_32
    a33 = resource.task.l114_33
    a34 = resource.task.l114_34
    a35 = resource.task.l114_35
    a36 = resource.task.l114_36
    a37 = resource.task.l114_37
    a38 = resource.task.l114_38
    a39 = resource.task.l114_39
    a40 = resource.task.l114_40
    a41 = resource.task.l114_41
    a42 = resource.task.l114_42
    a43 = resource.task.l114_43
    a44 = resource.task.l114_44
    a45 = resource.task.l114_45
    a46 = resource.task.l114_46
    a47 = resource.task.l114_47
    a48 = resource.task.l114_48
    a49 = resource.task.l114_49
    a50 = resource.task.l114_50
  }
}

resource "task" "l110" {
  description = "L110 the setup fails the first time"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "setup fails once"
    setup {
      script = "scripts/l110_setup_once.sh"
    }
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l111" {
  description = "L111 the setup fails the first time; no check"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "setup only"
    setup {
      script = "scripts/l111_setup_once.sh"
    }
  }
}

resource "task" "l112_req" {
  description = "L112 the required task (its check fails, its solve passes)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails"
    check {
      script = "scripts/fail1.sh"
      failure_message = "L112 required task failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l112_dep" {
  description = "L112 requires l112_req"
  prerequisites = [resource.task.l112_req]
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l113" {
  description = "L113 Check spam: a 2 s check that logs every run"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "logs runs"
    check {
      script = "scripts/l113_spam.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l113_read" {
  description = "L113 reader: did two runs overlap?"
  config {
    target = resource.container.c1
    failure_exit_codes = [1]
  }
  condition "c1" {
    description = "no overlap"
    check {
      script = "scripts/l113_overlap.sh"
      failure_message = "L113: two check runs overlapped"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_01" {
  description = "L114 task 1 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_02" {
  description = "L114 task 2 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_03" {
  description = "L114 task 3 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_04" {
  description = "L114 task 4 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_05" {
  description = "L114 task 5 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_06" {
  description = "L114 task 6 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_07" {
  description = "L114 task 7 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_08" {
  description = "L114 task 8 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_09" {
  description = "L114 task 9 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_10" {
  description = "L114 task 10 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_11" {
  description = "L114 task 11 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_12" {
  description = "L114 task 12 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_13" {
  description = "L114 task 13 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_14" {
  description = "L114 task 14 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_15" {
  description = "L114 task 15 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_16" {
  description = "L114 task 16 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_17" {
  description = "L114 task 17 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_18" {
  description = "L114 task 18 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_19" {
  description = "L114 task 19 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_20" {
  description = "L114 task 20 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_21" {
  description = "L114 task 21 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_22" {
  description = "L114 task 22 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_23" {
  description = "L114 task 23 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_24" {
  description = "L114 task 24 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_25" {
  description = "L114 task 25 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_26" {
  description = "L114 task 26 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_27" {
  description = "L114 task 27 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_28" {
  description = "L114 task 28 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_29" {
  description = "L114 task 29 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_30" {
  description = "L114 task 30 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_31" {
  description = "L114 task 31 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_32" {
  description = "L114 task 32 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_33" {
  description = "L114 task 33 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_34" {
  description = "L114 task 34 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_35" {
  description = "L114 task 35 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_36" {
  description = "L114 task 36 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_37" {
  description = "L114 task 37 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_38" {
  description = "L114 task 38 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_39" {
  description = "L114 task 39 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_40" {
  description = "L114 task 40 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_41" {
  description = "L114 task 41 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_42" {
  description = "L114 task 42 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_43" {
  description = "L114 task 43 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_44" {
  description = "L114 task 44 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_45" {
  description = "L114 task 45 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_46" {
  description = "L114 task 46 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_47" {
  description = "L114 task 47 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_48" {
  description = "L114 task 48 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_49" {
  description = "L114 task 49 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "l114_50" {
  description = "L114 task 50 of 50 on one page"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
