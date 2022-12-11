import common
import regex

fn sum(d []int) int {
	mut r := 0

	for v in d {
		r += v
	}

	return r
}

fn main() {
	/*
	Find all of the directories with a total size of at most 100000.
		What is the sum of the total sizes of those directories?
	*/

	history := common.read_lines(year: 2022, day: 7).filter(it.len > 0)

	// fs
	mut path := ['~']
	mut sizes := map[string]int{}

	mut re := regex.regex_opt(r'\d+') or { panic(err) }

	// Parse command
	for line in history {
		if line.starts_with('$') {
			items := line.split(' ')

			command := items[1]
			args := items[2..]

			match command {
				'ls' {}
				'cd' {
					if args[0] == '/' {
						path = ['~'] // go back to root
					} else if args[0] == '..' {
						path = path#[..-1] // go back one tree
					} else {
						// custom directory
						path << args[0]
					}
				}
				else {}
			}
		} else if line.starts_with('dir') {
			sizes[path.join('/')] += 0
		} else {
			// catch dir outputs
			sizes[path.join('/')] += re.find_all_str(line).map(it.int())[0]
		}
	}

	// Update sizes now that we have the whole thing
	paths := sizes.keys()

	for i, j in paths {
		for p in paths[i + 1..] {
			if p.starts_with(j) {
				sizes[j] += sizes[p]
			}
		}
	}

	// Find Max
	sum_of_filesizes := sum(sizes.values().filter(it <= 100_000))

	//
	required_spaces := 30_000_000 - (70_000_000 - sizes['~'])

	mut candidates := sizes.values().filter(it >= required_spaces)
	candidates.sort()

	println('P1: ${sum_of_filesizes}\nP2: ${candidates[0]}')
}
