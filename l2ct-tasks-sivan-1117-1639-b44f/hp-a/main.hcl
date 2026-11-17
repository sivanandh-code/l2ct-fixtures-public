resource "lab" "l2ct" {
  title       = "hp-a"
  description = "l2ct-tasks fixture hp-a. Generated; do not edit by hand."
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
        title     = "Step 7"
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
    t01 = resource.task.h01
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h02
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.h03
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.h04
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.h04r
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.h05
  }
}

resource "page" "p07" {
  title = "Step 7"
  file  = "instructions/p07.md"
  activities = {
    t07 = resource.task.h09
  }
}

resource "task" "h01" {
  description = "H01 setup still running"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow setup"
    setup {
      script = "scripts/setup_slow.sh"
    }
    check {
      script = "scripts/ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h02" {
  description = "H02 check then skip"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow ok"
    check {
      script = "scripts/sleep3_ok.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h03" {
  description = "H03 skip twice, retry done"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails"
    check {
      script = "scripts/fail1.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h04" {
  description = "H04 two tabs check"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "slow fail"
    check {
      script = "scripts/h04_slow_fail.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h04r" {
  description = "H04 reader"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "detects overlap"
    check {
      script = "scripts/h04_overlap.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h05" {
  description = "H05 refresh mid check"
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

resource "task" "h09" {
  description = "H09 browser offline mid check"
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
