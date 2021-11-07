# Enable all rules by default
all

# Allow any Heading styles
exclude_rule 'MD003'

# First line of the file is not required to be the top-level heading
exclude_rule 'MD041'

# Allow the use of emphasis for small-headers
exclude_rule 'MD036'

# Allow multiple top-level headers per file
exclude_rule 'MD025'

# Allow the used of trailing punctuation in headers
exclude_rule 'MD026'

# Disable line length
exclude_rule 'MD013'

# Extend line length, since each sentence should be on a separate line.
# rule 'MD013', :line_length => 200

# Prefix ordered lists with incremental numbers instead of all ones
rule 'MD029', style: 'ordered'
