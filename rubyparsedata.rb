# -*- coding: utf-8 -*-

data = <<-EOF
 addrmap_ntimc0 = insFld(foldersTree, gFld("ntimc0 @0x0.0x0.0x0", "ntimc0_doc.html#addrmap_ntimc0"))
    addrmap_ntimc0_ntimc_core = insFld(addrmap_ntimc0, gFld("ntimc_core @0x0.0x0.0x0", "ntimc0_doc.html#addrmap_ntimc0_ntimc_core"))
      reg_ntimc0_ntimc_core_CFG = insDoc(addrmap_ntimc0_ntimc_core, gLnk("R", "CFG @0x0.0x0.0x0", "ntimc0_doc.html#reg_ntimc0_ntimc_core_CFG"))
…
  addrmap_ntimc1 = insFld(foldersTree, gFld("ntimc1 @0x1.0x0.0x0", "ntimc1_doc.html#addrmap_ntimc1"))
    addrmap_ntimc1_ntimc_core = insFld(addrmap_ntimc1, gFld("ntimc_core @0x1.0x0.0x0", "ntimc1_doc.html#addrmap_ntimc1_ntimc_core"))
      reg_ntimc1_ntimc_core_CFG = insDoc(addrmap_ntimc1_ntimc_core, gLnk("R", "CFG @0x1.0x0.0x0", "ntimc1_doc.html#reg_ntimc1_ntimc_core_CFG"))
EOF

data.lines.each do |l|
  (lval,rval) = l.strip.split(/\s*=\s*/)
  puts "lval=#{lval}"
  puts "rval=#{rval}"
end
