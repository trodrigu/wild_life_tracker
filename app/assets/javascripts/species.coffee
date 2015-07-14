# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
container = document.querySelector('#container')
myPackery = new Packery(container, {itemSelector: '.item', gutter: 25})
myPackery.layout()
console.log 'yep'
