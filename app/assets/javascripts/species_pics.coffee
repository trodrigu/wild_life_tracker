jQuery ($) ->
  Dropzone.autoDiscover = false
  dropzone = new Dropzone ".dropzone", maxFilesize:256, paramName: "species_pic[avatar]", addRemoveLinks: false
  dropzone.on 'success', (file) ->
    console.log 'worked'
    @removeFile file
    $.getScript '/images'
    return
