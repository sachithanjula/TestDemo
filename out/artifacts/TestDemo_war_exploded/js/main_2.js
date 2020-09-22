var cropper;

function check(image,options,actions,download,URL,Cropper,inputImg) {
  'use strict';


  cropper = new Cropper(image, options);
  var originalImageURL = image.src;
  var uploadedImageType = 'image/jpeg';
  var uploadedImageName = 'cropped.jpg';
  var uploadedImageURL;

  // Tooltip
  $('[data-toggle="tooltip"]').tooltip();

  // Buttons
  if (!document.createElement('canvas').getContext) {
    $('button[data-method="getCroppedCanvas"]').prop('disabled', true);
  }

  if (typeof document.createElement('cropper').style.transition === 'undefined') {
    $('button[data-method="rotate"]').prop('disabled', true);
    $('button[data-method="scale"]').prop('disabled', true);
  }

  // Download
  // if (typeof download.download === 'undefined') {
  //   download.className += ' disabled';
  //   download.title = 'Your browser does not support download';
  // }

  // Options
  actions.querySelector('.docs-toggles').onchange = function (event) {
    var e = event || window.event;
    var target = e.target || e.srcElement;
    var cropBoxData;
    var canvasData;
    var isCheckbox;
    var isRadio;

    if (!cropper) {
      return;
    }

    if (target.tagName.toLowerCase() === 'label') {
      target = target.querySelector('input');
    }

    isCheckbox = target.type === 'checkbox';
    isRadio = target.type === 'radio';

    if (isCheckbox || isRadio) {
      if (isCheckbox) {
        options[target.name] = target.checked;
        cropBoxData = cropper.getCropBoxData();
        canvasData = cropper.getCanvasData();

        options.ready = function () {
          console.log('ready');
          cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
        };
      } else {
        options[target.name] = target.value;
        options.ready = function () {
          console.log('ready');
        };
      }

      // Restart
      cropper.destroy();
      cropper = new Cropper(image, options);
    }
  };

  // Methods
  actions.querySelector('.docs-buttons').onclick = function (event) {
    var e = event || window.event;
    var target = e.target || e.srcElement;
    var cropped;
    var result;
    var input;
    var data;

    if (!cropper) {
      return;
    }

    while (target !== this) {
      if (target.getAttribute('data-method')) {
        break;
      }

      target = target.parentNode;
    }

    if (target === this || target.disabled || target.className.indexOf('disabled') > -1) {
      return;
    }

    data = {
      method: target.getAttribute('data-method'),
      target: target.getAttribute('data-target'),
      option: target.getAttribute('data-option') || undefined,
      secondOption: target.getAttribute('data-second-option') || undefined
    };

    cropped = cropper.cropped;

    if (data.method) {
      if (typeof data.target !== 'undefined') {
        input = document.querySelector(data.target);

        if (!target.hasAttribute('data-option') && data.target && input) {
          try {
            data.option = JSON.parse(input.value);
          } catch (e) {
            console.log(e.message);
          }
        }
      }

      switch (data.method) {
        case 'rotate':
          if (cropped && options.viewMode > 0) {
            cropper.clear();
          }

          break;

        case 'getCroppedCanvas':
          try {
            data.option = JSON.parse(data.option);
          } catch (e) {
            console.log(e.message);
          }

          if (uploadedImageType === 'image/jpeg') {
            if (!data.option) {
              data.option = {};
            }

            data.option.fillColor = '#fff';
          }

          break;
      }

      result = cropper[data.method](data.option, data.secondOption);

      switch (data.method) {
        case 'rotate':
          if (cropped && options.viewMode > 0) {
            cropper.crop();
          }

          break;

        case 'scaleX':
        case 'scaleY':
          target.setAttribute('data-option', -data.option);
          break;

        case 'getCroppedCanvas':
          if (result) {
            // Bootstrap's Modal
            $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);

            if (!download.disabled) {
              download.download = uploadedImageName;
              download.href = result.toDataURL(uploadedImageType);
            }
          }

          break;

        case 'destroy':
          cropper = null;

          if (uploadedImageURL) {
            URL.revokeObjectURL(uploadedImageURL);
            uploadedImageURL = '';
            image.src = originalImageURL;
          }

          break;
      }

      if (typeof result === 'object' && result !== cropper && input) {
        try {
          input.value = JSON.stringify(result);
        } catch (e) {
          console.log(e.message);
        }
      }
    }
  };

  document.body.onkeydown = function (event) {
    var e = event || window.event;

    if (e.target !== this || !cropper || this.scrollTop > 300) {
      return;
    }

    switch (e.keyCode) {
      case 37:
        e.preventDefault();
        cropper.move(-1, 0);
        break;

      case 38:
        e.preventDefault();
        cropper.move(0, -1);
        break;

      case 39:
        e.preventDefault();
        cropper.move(1, 0);
        break;

      case 40:
        e.preventDefault();
        cropper.move(0, 1);
        break;
    }
  };

  // Import image
  var inputImage = inputImg;

  if (URL) {
    inputImage.onchange = function () {
      var files = this.files;
      var file;

      if (cropper && files && files.length) {
        file = files[0];

        if (/^image\/\w+/.test(file.type)) {
          uploadedImageType = file.type;
          uploadedImageName = file.name;

          if (uploadedImageURL) {
            URL.revokeObjectURL(uploadedImageURL);
          }

          image.src = uploadedImageURL = URL.createObjectURL(file);
          cropper.destroy();
          cropper = new Cropper(image, options);
          inputImage.value = null;
        } else {
          window.alert('Please choose an image file.');
        }
      }
    };
  } else {
    inputImage.disabled = true;
    inputImage.parentNode.className += ' disabled';
  }
};



function uploadImageWhatsApp() {

    $("#uploadImgBtn").prop("disabled", true);

    var path=$('#context_path').val();

    swal({
        title: 'Uploading...!',
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        buttonsStyling: false,
        confirmButtonClass: 'btn btn-primary',
        cancelButtonClass: 'btn btn-light',
        onOpen: () => {
            swal.showLoading();
            $('.swal2-actions').html('<div class="spinner-box"><div class="circle-border" style=" background: linear-gradient(0deg, rgba(37,211,102,0.1) 33%, rgb(37,211,102) 100%);"><div class="circle-core"></div> </div> </div>');

            ///

            cropper.getCroppedCanvas().toBlob((blob) => {
                const formData = new FormData();
                // Pass the image file name as the third parameter if necessary.
                var imgtag = Math.random().toString(36).substring(2, 15);
                $('#imgtagform').val(imgtag);
                formData.append('imageFile', blob, 'cropped.jpg');
                formData.append('imgTag', imgtag);
                // Use `jQuery.ajax` method for example
                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: path+'ImageUploader',
                    data: formData,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {

                        swal.hideLoading();
                        swal({
                            title: 'Uploaded!',
                            text: 'Upload Successfully.',
                            type: 'success',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-primary',
                            cancelButtonClass: 'btn btn-light'
                        });

                        $("#uploadImgBtn").prop("disabled", false);
                        console.log("SUCCESS : ", data);

                    },
                    error: function (e) {

                        swal.hideLoading();
                        swal({
                            title: 'Upload Failed',
                            type: 'error',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-danger',
                            cancelButtonClass: 'btn btn-light'
                        });

                        $("#uploadImgBtn").prop("disabled", false);
                    }
                });

            }, 'image/jpg');

        }
    });




}



function uploadImageIconWhatsApp() {

    $("#uploadIconBtn").prop("disabled", true);

    var path=$('#context_path').val();


    swal({
        title: 'Uploading...!',
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: false,
        buttonsStyling: false,
        confirmButtonClass: 'btn btn-primary',
        cancelButtonClass: 'btn btn-light',
        onOpen: () => {
            swal.showLoading();
            $('.swal2-actions').html('<div class="spinner-box"><div class="circle-border" style=" background: linear-gradient(0deg, rgba(37,211,102,0.1) 33%, rgb(37,211,102) 100%);"><div class="circle-core"></div> </div> </div>');

            ///


            cropper.getCroppedCanvas().toBlob((blob) => {
                const formData = new FormData();
                // Pass the image file name as the third parameter if necessary.
                formData.append('iconFile', blob, 'cropped.jpg');
                var icontag = Math.random().toString(36).substring(2, 15);
                $('#icontagform').val(icontag);
                formData.append('iconTag', icontag);
                // Use `jQuery.ajax` method for example
                $.ajax({
                    type: "POST",
                    enctype: 'multipart/form-data',
                    url: path+'IconUploader',
                    data: formData,
                    processData: false,
                    contentType: false,
                    cache: false,
                    timeout: 600000,
                    success: function (data) {

                        swal.hideLoading();
                        swal({
                            title: 'Uploaded!',
                            text: 'Upload Successfully.',
                            type: 'success',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-primary',
                            cancelButtonClass: 'btn btn-light'
                        });

                        $("#uploadIconBtn").prop("disabled", false);
                        console.log("SUCCESS : ", data);

                    },
                    error: function (e) {

                        swal.hideLoading();
                        swal({
                            title: 'Upload Failed',
                            type: 'error',
                            buttonsStyling: false,
                            confirmButtonClass: 'btn btn-danger',
                            cancelButtonClass: 'btn btn-light'
                        });

                        $("#uploadIconBtn").prop("disabled", false);
                    }
                });

            }, 'image/jpg');

        }
    });



}