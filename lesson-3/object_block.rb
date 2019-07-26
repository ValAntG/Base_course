module ObjectBlock
  def object_block(object, &block)
    block.call(object)
  end
end
