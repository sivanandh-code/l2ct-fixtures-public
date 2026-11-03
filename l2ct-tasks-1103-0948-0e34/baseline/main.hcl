resource "lab" "l2ct" {
  title       = "baseline"
  description = "l2ct-tasks fixture baseline. Generated; do not edit by hand."
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
    }
  }
}

resource "layout" "main" {
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
    t01 = resource.task.ok
  }
}

resource "task" "ok" {
  description = "Baseline: passes"
  success_message = "Well done"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "passes"
    check {
      script = "scripts/ok.sh"
    }
  }
}
