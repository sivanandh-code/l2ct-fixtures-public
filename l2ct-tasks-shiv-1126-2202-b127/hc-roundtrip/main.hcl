# K201: comments and odd spacing must survive the import byte for byte
// a line comment
/* a block
   comment */

resource "lab" "l2ct" {
  title       = "hc-roundtrip"
  description   =   "l2ct-tasks fixture hc-roundtrip. Generated; do not edit by hand."   # aligned oddly
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
    width = "100"
    instructions {}
  }
}

resource "page" "p01" {
  title = "Step 1"
  file  = "instructions/p01.md"
  activities = {
    t01 = resource.task.k201
  }
}

resource "task" "k201" {
  description = "K201 byte round trip"
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
