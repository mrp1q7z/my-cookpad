module RecipesHelper
  def ingredients_title_example(index)
    case index
    when 0 then '例）豚肉'
    when 1 then '例）にんじん'
    when 2 then '例）大根'
    else nil
    end
  end

  def ingredients_quantity_example(index)
    case index
    when 0 then '例）350g'
    when 1 then '例）1本'
    when 2 then '例）1/2本'
    else nil
    end
  end
end
