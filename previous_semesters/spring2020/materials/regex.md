## Fundamental regular expressions in `R`

Regular Expression | Meaning 
-------------------|---------
`\w`               | Letter, number, or underscore  |
`\W`               | Any non- letter, number, or underscore
`\d`               | Number | 
`\D`               | Any non-number | 
`[]`               | Custom character set <br>E.g.,`[ACGT]` will detect any occurrence of A, C, G, or T only
`[^]`               | Exclude custom character set <br>E.g.,`[^ACGT]` will detect any occurrence **that isn't** A, C, G, or T (case sensitive!)
`\t`               | Tab symbol
`\n`               | New line. **Note:** Your system might use `\r`.
`\s`               | Any type of whitespace
`\S`               | Anything **not** whitespace
`.`                | Wildcard (matches anything)

## Symbols and quanitifiers

Regular Expression add-ons | Meaning | Example
-------------------|---------|---------
`\`                | Escape symbol to search for a literal string | `\.` matches an actual period
`^`                | Match the **start** of the line only | `^>` matches any `>` that begins a line
`$`                | Match the **end** of the line only | `$t` matches any lower-case `t` that ends a line
                | Quantifier: Match 1 or more occurrences | `\w+` matches 1 or more letters, numbers, or underscores
`*`                | Quantifier: Match 0 or more occurrences <br> | `\w*` matches 0 or more letters, numbers, or underscores
`{}`               | Quantifier: Match a specified number of times (in a row!) | `\d{2}` Matches exactly 2 numbers <br> `\d{1,4}` matches (inclusive) between 1 and 4 numbers <br> `\d{5,}` matches 5 or more numbers <br> `\d{,3}` matches 3 or fewer numbers
`?`                | Quantifier: Make the previous character *optional* | `colou?r` matches either `color` or `colour`.
`()`               | Capture text inside parentheses for subsequent literal replacement (see next section)


## Replacing text

When performing search/replace, you often want to save some elements of the "searched text" to incorporate into the "replace text". To this end, text can be *captured with parentheses*, and re-inserted with `$1`, `$2`, etc. (or `\\1`, `\\2`, etc. in `grep`) for each of the captured groups.

__Some examples:__

Original text | Search Term | Replace with | New text
--------------|-------------|--------------|---------
`I would like a new dog.` | `(.+ )dog\.` | `$1cat.` | `I would like a new cat.`
`I am 75 years old.` | `(I am) (\d+) years old.` | `$1 28, not $2.` | `I am 28, not 75.`
`AC-GTT---AGANN??GCTA?` | `([N\?-])` | (replace w/ nothing) | `ACGTTAGAGCTA`
`AC-GTT---AGANN??GCTA?` | `[^ACGT]` | (replace w/ nothing) | `ACGTTAGAGCTA`
