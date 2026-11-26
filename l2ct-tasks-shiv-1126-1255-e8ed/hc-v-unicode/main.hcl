resource "lab" "l2ct" {
  title       = "K603 🚀 日本語 lab"
  description = "l2ct-tasks fixture hc-v-unicode. Generated; do not edit by hand."
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
    t01 = resource.task.k603
  }
}

resource "task" "k603" {
  description = "K603 日本語 עברית 🚀 café é"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "👩‍💻 condition é"
    check {
      script = "scripts/fail1.sh"
      failure_message = "K605 🚀 café 日本語 עברית é  nbsp 👩‍💻 end"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
