resource "lab" "l2ct" {
  title       = "hs-main"
  description = "l2ct-tasks fixture hs-main. Generated; do not edit by hand."
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
      page "p09" {
        title     = "Step 9"
        reference = resource.page.p09
      }
      page "p10" {
        title     = "Step 10"
        reference = resource.page.p10
      }
      page "p11" {
        title     = "Step 11"
        reference = resource.page.p11
      }
      page "p12" {
        title     = "Step 12"
        reference = resource.page.p12
      }
      page "p13" {
        title     = "Step 13"
        reference = resource.page.p13
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
    t01 = resource.task.h17
  }
}

resource "page" "p02" {
  title = "Step 2"
  file  = "instructions/p02.md"
  activities = {
    t02 = resource.task.h16
  }
}

resource "page" "p03" {
  title = "Step 3"
  file  = "instructions/p03.md"
  activities = {
    t03 = resource.task.h19
  }
}

resource "page" "p04" {
  title = "Step 4"
  file  = "instructions/p04.md"
  activities = {
    t04 = resource.task.h15a
  }
}

resource "page" "p05" {
  title = "Step 5"
  file  = "instructions/p05.md"
  activities = {
    t05 = resource.task.h15b
  }
}

resource "page" "p06" {
  title = "Step 6"
  file  = "instructions/p06.md"
  activities = {
    t06 = resource.task.h15c
  }
}

resource "page" "p07" {
  title = "Step 7"
  file  = "instructions/p07.md"
  activities = {
    t07 = resource.task.h18a
  }
}

resource "page" "p08" {
  title = "Step 8"
  file  = "instructions/p08.md"
  activities = {
    t08 = resource.task.h12
  }
}

resource "page" "p09" {
  title = "Step 9"
  file  = "instructions/p09.md"
  activities = {
    t09 = resource.task.h13
  }
}

resource "page" "p10" {
  title = "Step 10"
  file  = "instructions/p10.md"
  activities = {
    t10 = resource.task.h14a
  }
}

resource "page" "p11" {
  title = "Step 11"
  file  = "instructions/p11.md"
  activities = {
    t11 = resource.task.h14b
  }
}

resource "page" "p12" {
  title = "Step 12"
  file  = "instructions/p12.md"
  activities = {
    t12 = resource.task.h14c
  }
}

resource "page" "p13" {
  title = "Step 13"
  file  = "instructions/p13.md"
  activities = {
    t13 = resource.task.h18b
  }
}

resource "task" "h17" {
  description = "H17 idempotency"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "changes a file"
    check {
      script = "scripts/h17_idem.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h16" {
  description = "H16 long failure message"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "fails with a long message"
    check {
      script = "scripts/fail1.sh"
      failure_message = "L2CT-FEEDBACK-MARK 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x onerror=alert(1)> &amp; 😀 **bold** _italic_ `code` [link](http://x) <b>bold</b> <img src=x one"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h19" {
  description = "H19 script changed while the session runs"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "version"
    check {
      script = "scripts/h19_version.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15a" {
  description = "H15 ANSI output"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "ansi"
    check {
      script = "scripts/h15_ansi.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15b" {
  description = "H15 binary output"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "binary"
    check {
      script = "scripts/h15_binary.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h15c" {
  description = "H15 5 MB output"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "5 MB"
    check {
      script = "scripts/h15_5mb.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h18a" {
  description = "H18 parallel, both fail"
  config {
    target = resource.container.c1
    parallel_exec { condition = true }
  }
  condition "c1" {
    description = "fast fail"
    check {
      script = "scripts/h18_fast_fail.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
  condition "c2" {
    description = "slow fail"
    check {
      script = "scripts/h18_slow_fail.sh"
    }
  }
}

resource "task" "h12" {
  description = "H12 background process"
  config {
    target = resource.container.c1
    timeout = "30s"
  }
  condition "c1" {
    description = "starts sleep 300 &"
    check {
      script = "scripts/h12_bg.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h13" {
  description = "H13 waits for stdin"
  config {
    target = resource.container.c1
    timeout = "30s"
  }
  condition "c1" {
    description = "read x"
    check {
      script = "scripts/h13_stdin.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h14a" {
  description = "H14 kill -9"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "signal"
    check {
      script = "scripts/h14_kill9.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h14b" {
  description = "H14 exit 255"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "255"
    check {
      script = "scripts/h14_255.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h14c" {
  description = "H14 exit 130"
  config {
    target = resource.container.c1
  }
  condition "c1" {
    description = "130"
    check {
      script = "scripts/h14_130.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
}

resource "task" "h18b" {
  description = "H18 parallel, one hangs"
  config {
    target = resource.container.c1
    parallel_exec { condition = true }
    timeout = "30s"
  }
  condition "c1" {
    description = "fast fail"
    check {
      script = "scripts/h18_fast_fail.sh"
    }
    solve {
      script = "scripts/ok.sh"
    }
  }
  condition "c2" {
    description = "hangs"
    check {
      script = "scripts/sleep600.sh"
    }
  }
}
