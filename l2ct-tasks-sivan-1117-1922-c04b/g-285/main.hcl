resource "lab" "l2ct" {
  title       = "g-285"
  description = "l2ct-tasks fixture g-285. Generated; do not edit by hand."
  layout      = resource.layout.main
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
    t01 = resource.task.t
  }
}

resource "task" "t" {
  description = "generated"
  config {
    target = resource.container.c1
    environment = { "K0" = "v", "K1" = "v", "K2" = "v", "K3" = "v", "K4" = "v", "K5" = "v", "K6" = "v", "K7" = "v", "K8" = "v", "K9" = "v", "K10" = "v", "K11" = "v", "K12" = "v", "K13" = "v", "K14" = "v", "K15" = "v", "K16" = "v", "K17" = "v", "K18" = "v", "K19" = "v", "K20" = "v", "K21" = "v", "K22" = "v", "K23" = "v", "K24" = "v", "K25" = "v", "K26" = "v", "K27" = "v", "K28" = "v", "K29" = "v", "K30" = "v", "K31" = "v", "K32" = "v", "K33" = "v", "K34" = "v", "K35" = "v", "K36" = "v", "K37" = "v", "K38" = "v", "K39" = "v", "K40" = "v", "K41" = "v", "K42" = "v", "K43" = "v", "K44" = "v", "K45" = "v", "K46" = "v", "K47" = "v", "K48" = "v", "K49" = "v", "K50" = "v", "K51" = "v", "K52" = "v", "K53" = "v", "K54" = "v", "K55" = "v", "K56" = "v", "K57" = "v", "K58" = "v", "K59" = "v", "K60" = "v", "K61" = "v", "K62" = "v", "K63" = "v", "K64" = "v", "K65" = "v", "K66" = "v", "K67" = "v", "K68" = "v", "K69" = "v", "K70" = "v", "K71" = "v", "K72" = "v", "K73" = "v", "K74" = "v", "K75" = "v", "K76" = "v", "K77" = "v", "K78" = "v", "K79" = "v", "K80" = "v", "K81" = "v", "K82" = "v", "K83" = "v", "K84" = "v", "K85" = "v", "K86" = "v", "K87" = "v", "K88" = "v", "K89" = "v", "K90" = "v", "K91" = "v", "K92" = "v", "K93" = "v", "K94" = "v", "K95" = "v", "K96" = "v", "K97" = "v", "K98" = "v", "K99" = "v" }
  }
  condition "c1" {
    description = "c"
    check {
      script = "scripts/ok.sh"
    }
  }
}
