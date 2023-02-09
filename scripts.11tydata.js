const wikilinkRegExp = /\[\[\s?([^\[\]\|\n\r]+)(\|[^\[\]\|\n\r]+)?\s?\]\]/g // This regex finds all wikilinks in a string
const {titleCase} = require('title-case');
function caselessCompare(a, b) {
		return a.toLowerCase() === b.toLowerCase();
}

module.exports = {
	lang: 'en',
	layout: 'scripts.html',
	image: '/tommi.space.wip.webp',
	scripts: {
		source: 'https://gitmi.dev/tommi/scripts'
	},
	// Automatically generating titles, as explained in https://github.com/11ty/eleventy/discussions/2241#discussioncomment-2224265
	eleventyComputed: {

		/************
		* Backlinks *
		************/
		title: data => titleCase(data.title || data.page.fileSlug),
		backlinks: (data) => {
			const allPages = data.collections.all;
			const currentFileSlug = data.page.fileSlug;

			let backlinks = [];

			// Search for backlinks in every page
			for(const otherNote of allPages) {
			const noteContent = otherNote.template.frontMatter.content;

			// Get all links from otherNote
			const outboundLinks = (noteContent.match(wikilinkRegExp) || [])
				.map(link => (
					// Extract link location
					link.slice(2,-2)
					.split('|')[0]
					.replace(/.(md|html)\s?$/i, '')
					.trim()
				));

				// If the other note links here, return related info
				if(outboundLinks.some(link => caselessCompare(link, currentFileSlug))) {

				// Construct preview for hovercards
					/*let preview = noteContent.slice(0, 240);*/

					backlinks.push({
						url: otherNote.url,
						title: otherNote.data.title//,
						//preview
					})
				}
			}
			return backlinks;
		}
	}
};