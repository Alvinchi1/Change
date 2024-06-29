#use puppet tomake some changestodefault ssh config
# so no one can connect without password

include stdlib

file_line { 'SSH Private Key':
  path               => '/etc/ssh/ssh_config',
  line               => '    IdentityFile ~/.ssh/school',
  match              => '^[#]+[\s]*(?i)IdentityFile[\s]+~/.ssh/id_rsa$',
  replace            => true,
  append_on_no_match => true,
}

#Regex explanation
#
#^      beginning of line
#[#]* at least one char
#[\s]* zero or more white space char
#(?i) PasswordAuth is case insensitive
#[\s]+ at least one white space char
#~/.ssh/id_rsa the ssh private key file path we want to replace
#$          end of line


file_line { 'Deny Password Auth':
  path               => '/etc/ssh/ssh_config',
  line               => '    PasswordAuthentication no',
  match              => '^[#]+[\s]*(?i)PasswordAuthentication[\s]+(yes|no)$',
  replace            => true,
  append_on_no_match => true
}

#Regex explanation
#
#^beginning of line
#[#]* at leastone char
#[\s]* zero or more white space char
#(?i) PasswordAuth is case insensitive
#[\s]+ at least one white space char
#(yes|no) with "yes" or "no"
#$   end of line
