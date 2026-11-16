resource "lab" "l2ct" {
  title       = "g-253"
  description = "l2ct-tasks fixture g-253. Generated; do not edit by hand."
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
    t01 = resource.task.t
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.other
  }
}

resource "task" "t" {
  description = "generated"
  prerequisites = [resource.task.other]
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

resource "task" "other" {
  description = "needs t"
  prerequisites = [resource.task.t]
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
