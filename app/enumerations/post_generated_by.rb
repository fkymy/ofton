class PostGeneratedBy < EnumerateIt::Base
  associate_values(
    :admin,
    :stranger,
    :user
  )
end
