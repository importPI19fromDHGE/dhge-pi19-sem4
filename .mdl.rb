# Enable all rules by default
all

# Allow any Heading styles
exclude_rule 'MD003' 

# First line of the file is not required to be the top-level heading
exclude_rule 'MD041'

# Allow the use of emphasis for small-headers
exclude_rule 'MD036'

# Extend line length, since each sentence should be on a separate line.
rule 'MD013', :line_length => 200
