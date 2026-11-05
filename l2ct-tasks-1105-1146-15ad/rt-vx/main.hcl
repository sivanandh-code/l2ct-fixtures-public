resource "lab" "l2ct" {
  title       = "rt-vx"
  description = "l2ct-tasks fixture rt-vx. Generated; do not edit by hand."
  layout      = resource.layout.main
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
    t01 = resource.task.no_check
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.zero_cond
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.dup
  }
}

resource "task" "no_check" {
  description = "Task 1 - condition without a check"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "setup only"
    setup {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "zero_cond" {
  description = "Task 2 - no conditions at all"
  config {
    target = resource.container.c1
  }
}

resource "task" "dup" {
  description = "dup FIRST definition"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "c"
    check {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "dup" {
  description = "dup SECOND definition"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "c"
    check {
      script = "scripts/ok.sh"
    }
  }
}
