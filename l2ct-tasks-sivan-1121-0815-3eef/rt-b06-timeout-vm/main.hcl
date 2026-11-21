resource "lab" "l2ct" {
  title       = "rt-b06-timeout-vm"
  description = "l2ct-tasks fixture rt-b06-timeout-vm. Generated; do not edit by hand."
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
    t01 = resource.task.b06
  }
}

resource "task" "b06" {
  description = "VM timeout"
  config {
    target = resource.vm.v1
    timeout = "10s"
  }
  condition "c1" {
    description = "sleep"
    check {
      script = "scripts/sleep600.sh"
    }
  }
}

resource "vm" "v1" {
  image {
    name = "debian:12"
  }
  resources {
    cpu    = 1
    memory = 1024
  }
  network {
    id = resource.network.net.meta.id
  }
}
