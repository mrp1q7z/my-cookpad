FactoryGirl.define do
  factory :recipe do
    title 'レシピ１'
    catch_copy 'キャッチコピー１'
    image_file_name 'mafin-01.jpg'
    image_content_type 'image/jpeg'
    image_file_size 170917

    trait :as_nil_title do
      title nil
    end

    trait :as_nil_catch_copy do
      catch_copy nil
    end

    trait :as_nil_image do
      image_file_name nil
      image_content_type nil
      image_file_size nil
    end
  end
end
