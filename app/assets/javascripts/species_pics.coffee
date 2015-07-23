jQuery ($) ->
  Dropzone.autoDiscover = false
  #dropzone = new Dropzone ".dropzone",
  $('.dropzone').dropzone
    paramName: "species_pic[avatar]",
    addRemoveLinks: false
  #dropzone.on 'success', (file) ->
    init: ->
      @on 'success', (file, json) ->
        @removeFile file
        $.getScript '/species_pics/index/' + $('#species_pic_species_id').val()
