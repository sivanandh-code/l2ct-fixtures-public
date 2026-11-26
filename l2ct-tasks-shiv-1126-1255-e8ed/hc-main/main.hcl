resource "lab" "l2ct" {
  title       = "hc-main"
  description = "l2ct-tasks fixture hc-main. Generated; do not edit by hand."
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
    t01 = resource.task.k103
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.k104
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.k501
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.k605
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.k401
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.k101
  }
}

resource "task" "k103" {
  description = "K103 re-check a completed task"
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

resource "task" "k104" {
  description = "K104 retry twice"
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

resource "task" "k501" {
  description = "K501 double skip"
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

resource "task" "k605" {
  description = "K605 unicode failure message"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails"
    check {
      script = "scripts/fail1.sh"
      failure_message = "K605 🚀 café 日本語 עברית é  nbsp 👩‍💻 end"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "k401" {
  description = "K401 bad player input"
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

resource "task" "k101" {
  description = "K101 target after stop"
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
