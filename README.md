domvm.js (DOM ViewModel)
------------------------
A thin, fast, dependency-free vdom diffing lib _(MIT Licensed)_

---
### Features

- Small - ~6k min, ~3k gzipped
- Very fast - see dbmonster & speedtest examples
- No dependencies, no build process
- Components - composable & independently refreshable
- Isomorphic - generate markup server-side and hydrate on client
- Learn in 10min - small API surface, pure-js templates
- Emit custom events to parent components (bubbling)
- SVG support
- IE9+

---
### Why not to use it

Because you'll represent 50% of this lib's entire userbase and ecosystem (at time of this writing).

---
### Usage/API

0. [Installation](#installation)
1. [Template Cheat Sheet](#template-cheat-sheet)
2. [Create, Modify, Redraw](#create-modify-redraw)
3. Multiple sub-views; modify and redraw a single sub-view
4. Trigger a parent (or any ancestor) to redraw from within a sub-view
5. Passing data into sub-views from parent view
6. Event delegation, index
7. DOM element references
8. Third party libs and `_guard`
9. Async redraw
10. Routing

---
#### Installation

**Browser**

```html
<script src="domvm.min.js"></script>
```

**Node**

```js
var domvm = require("domvm");
```

---
#### Template Cheat Sheet

```js
["p", "Hello"]										// plain tags

["p#foo.bar.baz", "Hello"]							// id and class shorthands
["input", {type: "checkbox", checked: true}]		// boolean attrs
["input", {type: "checkbox", ".checked": true}]		// set property instead of attr
["button", {onclick: function(e) {...}}, "Hello"]	// event handlers
["p", {style: "font-size: 10pt;"}, "Hello"]			// style can be a string
["p", {style: {fontSize: "10pt;"}}, "Hello"]		// ... or an object (camelCase only)

["h1", [											// child array can follow tag
	["em", "Important!"],
	["sub", "tiny"],
]]

["a", {href: "/cows"}, [							// ... and can contain text nodes
	"foo",
	["br"],
	["strong", "bar"],
	"baz",
]]

["#ui", [											// same as div#ui
	NavBarView,										// sub-view func w/ closured data
	[PanelView, "someParam1", "someParam2"],		// ... or with passed-in data
]]
```

---
#### Create, Modify, Redraw

```js
// a list of people
var people = [
	{name: "Peter", age: 31},
	{name: "Morgan", age: 27},
	{name: "Mark", age: 70},
];

function PeopleView() {
	return {
		render: function() {
			return ["ul.people-list", people.map(function(person) {
				return ["li", person.name + " (aged " + person.age + ")"];
			})];
		}
	};
}

// create view model from list & render to document
var vm = domvm(PeopleView).mount(document.body);

// modify the list
people.shift();
people = people.concat([
	{name: "Allison", age: 15},
	{name: "Sergey", age: 39},
]);

// redraw view model
vm.redraw();
```

---
### Demos

---
### Credits

API heavily inspired by https://github.com/creationix/domchanger