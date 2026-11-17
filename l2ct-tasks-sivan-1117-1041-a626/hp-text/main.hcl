resource "lab" "l2ct" {
  title       = "hp-text"
  description = "l2ct-tasks fixture hp-text. Generated; do not edit by hand."
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
      page "p08" {
        title     = "Step 8"
        reference = resource.page.p08
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
    t01 = resource.task.tm1
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.tm2
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.tm3
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.tm4
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.tm5
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.tm6
  }
}

resource "page" "p07" {
  title = "Step 7"
  file  = "instructions/p07.md"
  activities = {
    t07 = resource.task.tm7
  }
}

resource "page" "p08" {
  title = "Step 8"
  file  = "instructions/p08.md"
  activities = {
    t08 = resource.task.tm8
  }
}

resource "task" "tm1" {
  description = "markup text: markup_html_tag"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "<b>L2CT-MARK</b>"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm2" {
  description = "markup text: markup_html_img"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "<img src=x onerror=alert(1)> L2CT-MARK"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm3" {
  description = "markup text: markup_md_link"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "[L2CT-MARK](http://example.invalid)"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm4" {
  description = "markup text: markup_md_bold"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "**L2CT-MARK**"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm5" {
  description = "markup text: markup_hcl_interp_raw"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "${L2CT-MARK}"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm6" {
  description = "markup text: markup_hcl_interp_escaped"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "$${L2CT-MARK}"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm7" {
  description = "markup text: markup_tmpl_braces"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "{{ L2CT-MARK }}"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "tm8" {
  description = "markup text: markup_tmpl_directive"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with markup in its message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "%{ if true }L2CT-MARK%{ endif }"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}
