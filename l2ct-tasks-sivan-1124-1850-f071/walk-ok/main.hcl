resource "lab" "l2ct" {
  title       = "walk-ok"
  description = "l2ct-tasks fixture walk-ok. Generated; do not edit by hand."
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
    t01 = resource.task.w1
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.wcount1
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.wcount2
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.wcount3
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.wcount4
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.wcount5
  }
}

resource "page" "p07" {
  title = "Step 7"
  file  = "instructions/p07.md"
  activities = {
    t07 = resource.task.wcount6
  }
}

resource "page" "p08" {
  title = "Step 8"
  file  = "instructions/p08.md"
  activities = {
    t08 = resource.task.wcount7
  }
}

resource "page" "p09" {
  title = "Step 9"
  file  = "instructions/p09.md"
  activities = {
    t09 = resource.task.wcount8
  }
}

resource "task" "w1" {
  description = "walk-ok: one task for state-machine walks"
  config {
    target = resource.container.c1
    timeout = "20s"
  }
  condition "c1" {
    description = "the check"
    check {
      script = "scripts/walk_ok.sh"
      failure_message = "walk check failed as designed"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "wcount1" {
  description = "walk-ok: reader 1, fails if the check ran more than 1 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count1.sh"
      failure_message = "the check script ran more than 1 time(s)"
    }
  }
}

resource "task" "wcount2" {
  description = "walk-ok: reader 2, fails if the check ran more than 2 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count2.sh"
      failure_message = "the check script ran more than 2 time(s)"
    }
  }
}

resource "task" "wcount3" {
  description = "walk-ok: reader 3, fails if the check ran more than 3 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count3.sh"
      failure_message = "the check script ran more than 3 time(s)"
    }
  }
}

resource "task" "wcount4" {
  description = "walk-ok: reader 4, fails if the check ran more than 4 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count4.sh"
      failure_message = "the check script ran more than 4 time(s)"
    }
  }
}

resource "task" "wcount5" {
  description = "walk-ok: reader 5, fails if the check ran more than 5 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count5.sh"
      failure_message = "the check script ran more than 5 time(s)"
    }
  }
}

resource "task" "wcount6" {
  description = "walk-ok: reader 6, fails if the check ran more than 6 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count6.sh"
      failure_message = "the check script ran more than 6 time(s)"
    }
  }
}

resource "task" "wcount7" {
  description = "walk-ok: reader 7, fails if the check ran more than 7 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count7.sh"
      failure_message = "the check script ran more than 7 time(s)"
    }
  }
}

resource "task" "wcount8" {
  description = "walk-ok: reader 8, fails if the check ran more than 8 time(s)"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "count"
    check {
      script = "scripts/walk_count8.sh"
      failure_message = "the check script ran more than 8 time(s)"
    }
  }
}
