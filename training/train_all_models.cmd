:: You can add more models types from here: https://tfhub.dev/s?module-type=image-classification&tf-version=tf2
:: However, you must choose Tensorflow 2 models. V1 models will not work here.
:: https://tfhub.dev/google/imagenet/mobilenet_v2_140_224/classification/4
:: https://tfhub.dev/google/imagenet/resnet_v2_50/classification/4
:: https://tfhub.dev/google/imagenet/inception_v3/classification/4
:: https://tfhub.dev/google/imagenet/nasnet_mobile/classification/4
::
:: If you get CUDA_OUT_OF_MEMORY crash, you need to pass --batch_size NUMBER, reducing until you don't get this error.
:: It is advised by Google not to have a batch size < 8.

:: Train Mobilenet V2 140
python make_nsfw_model.py --image_dir %cd%\..\images --image_size 224 --saved_model_dir %cd%\..\trained_models\mobilenet_v2_140_224 --labels_output_file %cd%\..\trained_models\mobilenet_v2_140_224\class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/mobilenet_v2_140_224/classification/4 --tflite_output_file %cd%\..\trained_models\mobilenet_v2_140_224\saved_model.tflite --train_epochs 5 --batch_size 16 --do_fine_tuning --learning_rate 0.01 --dropout_rate 0.05
:: Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
:: tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve %cd%\..\trained_models\mobilenet_v2_140_224 %cd%\..\trained_models\mobilenet_v2_140_224\web_model

:: Train Resnet V2 50
python make_nsfw_model.py --image_dir %cd%\..\images --image_size 224 --saved_model_dir %cd%\..\trained_models\resnet_v2_50_224 --labels_output_file %cd%\..\trained_models\resnet_v2_50_224\class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/resnet_v2_50/classification/4 --tflite_output_file %cd%\..\trained_models\resnet_v2_50_224\saved_model.tflite --train_epochs 5 --do_fine_tuning --batch_size 16 --learning_rate 0.01 --dropout_rate 0.05
:: Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
::tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve %cd%\..\trained_models\resnet_v2_50_224 %cd%\..\trained_models\resnet_v2_50_224\web_model

:: Train Inception V3
python make_nsfw_model.py --image_dir %cd%\..\images --image_size 224 --saved_model_dir %cd%\..\trained_models\inception_v3_224 --labels_output_file %cd%\..\trained_models\inception_v3_224\class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/inception_v3/classification/4 --tflite_output_file %cd%\..\trained_models\inception_v3_224\saved_model.tflite --train_epochs 5 --do_fine_tuning --batch_size 12 --learning_rate 0.01 --dropout_rate 0.05
:: Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
::tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve %cd%\..\trained_models\inception_v3_224 %cd%\..\trained_models\inception_v3_224\web_model

:: Train NasNetMobile
python make_nsfw_model.py --image_dir %cd%\..\images --image_size 224 --saved_model_dir %cd%\..\trained_models\nasnet_a_224 --labels_output_file %cd%\..\trained_models\nasnet_a_224\class_labels.txt --tfhub_module https://tfhub.dev/google/imagenet/nasnet_mobile/classification/4 --tflite_output_file %cd%\..\trained_models\nasnet_a_224\saved_model.tflite --train_epochs 5 --do_fine_tuning --batch_size 16 --learning_rate 0.01 --dropout_rate 0.05
:: Note that installing tensorflowjs also installs tensorflow-cpu A.K.A. bye-bye-training.
::tensorflowjs_converter --input_format=tf_saved_model --output_format=tfjs_graph_model --signature_name=serving_default --saved_model_tags=serve %cd%\..\trained_models\nasnet_a_224 %cd%\..\trained_models\nasnet_a_224\web_model