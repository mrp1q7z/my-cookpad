require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  it "タイトル、ユーザーIDがあれば有効な状態であること" do
    recipe = Recipe.new(title: 'test', user_id: 1)
    expect(recipe).to be_valid
  end

  it "タイトルがなければ無効な状態であること" do
    recipe = Recipe.new(title: nil)
    recipe.valid?
    expect(recipe.errors[:title]).to include("can't be blank")
  end

  it "ユーザーIDがなければ無効な状態であること" do
    recipe = Recipe.new(user_id: nil)
    recipe.valid?
    expect(recipe.errors[:user_id]).to include("can't be blank")
  end

  it "初期状態はdraftであること" do
    recipe = Recipe.new
    expect(recipe.status).to eq 'draft'
  end

  it "タイトル、キャッチコピー、画像、材料、作り方があれば公開できること" do
    recipe = FactoryGirl.build(:recipe)
    recipe.ingredients.build(FactoryGirl.attributes_for(:ingredient))
    recipe.directions.build(FactoryGirl.attributes_for(:direction))
    recipe.publish
    expect(recipe).to be_valid
    expect(recipe.status).to eq 'published'
  end

  it "タイトルがなければ公開できないこと" do
    recipe = FactoryGirl.build(:recipe, :as_nil_title)
    recipe.ingredients.build(FactoryGirl.attributes_for(:ingredient))
    recipe.directions.build(FactoryGirl.attributes_for(:direction))
    recipe.publish
    expect(recipe).to be_invalid
    expect(recipe.status).to eq 'draft'
    expect(recipe.errors[:title]).to include("can't be blank")
  end

  it "キャッチコピーがなければ公開できないこと" do
    recipe = FactoryGirl.build(:recipe, :as_nil_catch_copy)
    recipe.ingredients.build(FactoryGirl.attributes_for(:ingredient))
    recipe.directions.build(FactoryGirl.attributes_for(:direction))
    recipe.publish
    expect(recipe).to be_invalid
    expect(recipe.status).to eq 'draft'
    expect(recipe.errors[:catch_copy]).to include("can't be blank")
  end

  it "画像がなければ公開できないこと" do
    recipe = FactoryGirl.build(:recipe, :as_nil_image)
    recipe.ingredients.build(FactoryGirl.attributes_for(:ingredient))
    recipe.directions.build(FactoryGirl.attributes_for(:direction))
    recipe.publish
    expect(recipe).to be_invalid
    expect(recipe.status).to eq 'draft'
    expect(recipe.errors[:image_file_name]).to include("can't be blank")
  end

  it "材料がなければ公開できないこと" do
    recipe = FactoryGirl.build(:recipe)
    recipe.directions.build(FactoryGirl.attributes_for(:direction))
    recipe.publish
    expect(recipe).to be_invalid
    expect(recipe.status).to eq 'draft'
    expect(recipe.errors[:ingredients]).to include("can't be blank")
  end

  it "作り方がなければ公開できないこと" do
    recipe = FactoryGirl.build(:recipe)
    recipe.ingredients.build(FactoryGirl.attributes_for(:ingredient))
    recipe.publish
    expect(recipe).to be_invalid
    expect(recipe.status).to eq 'draft'
    expect(recipe.errors[:directions]).to include("can't be blank")
  end
end
