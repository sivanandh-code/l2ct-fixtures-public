resource "lab" "l2ct" {
  title       = "rt-b04-unlisted-exit"
  description = "l2ct-tasks fixture rt-b04-unlisted-exit. Generated; do not edit by hand."
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
    t01 = resource.task.b04
  }
}

resource "task" "b04" {
  description = "Unlisted exit code 3"
  config {
    target = resource.container.c1
    failure_exit_codes = [2]
  }
  condition "c1" {
    description = "unlisted"
    check {
      script = "scripts/fail3.sh"
      failure_message = "msg"
    }
  }
}
