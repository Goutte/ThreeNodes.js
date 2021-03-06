define [
  'use!Underscore', 
  'use!Backbone',
  'order!threenodes/models/Node',
  'order!threenodes/utils/Utils',
], (_, Backbone) ->
  "use strict"
  
  $ = jQuery
  
  class ThreeNodes.nodes.IfElse extends ThreeNodes.NodeBase
    @node_name = 'IfElse'
    @group_name = 'Conditional'
    
    set_fields: =>
      super
      @fields.addFields
        inputs:
          "condition" : false
          "val1" : {type: "Any", val: 0.0}
          "val2" : {type: "Any", val: 1.0}
        outputs:
          "out" : {type: "Any", val: false}
  
    compute: =>
      cond = @fields.getField("condition").getValue()
      if cond == false
        res = @fields.getField("val1").attributes.value
      else
        res = @fields.getField("val2").attributes.value
      @fields.setField("out", res)
  
  class ThreeNodes.nodes.And extends ThreeNodes.NodeBase
    @node_name = 'And'
    @group_name = 'Conditional'
    
    set_fields: =>
      super
      @fields.addFields
        inputs:
          "val1" : false
          "val2" : false
        outputs:
          "out" : false
  
    compute: =>
      res = @fields.getField("val1").getValue() != false && @fields.getField("val2").getValue() != false
      @fields.setField("out", res)
  
  class ThreeNodes.nodes.Or extends ThreeNodes.NodeBase
    @node_name = 'Or'
    @group_name = 'Conditional'
    
    set_fields: =>
      super
      @fields.addFields
        inputs:
          "val1" : false
          "val2" : false
        outputs:
          "out" : false
  
    compute: =>
      res = @fields.getField("val1").getValue() != false || @fields.getField("val2").getValue() != false
      @fields.setField("out", res)
  
  class ThreeNodes.nodes.Equal extends ThreeNodes.NodeBase
    @node_name = 'Equal'
    @group_name = 'Conditional'
    
    set_fields: =>
      super
      @fields.addFields
        inputs:
          "val1" : {type: "Any", val: 0.0}
          "val2" : {type: "Any", val: 1.0}
        outputs:
          "out" : false
  
    compute: =>
      res = @fields.getField("val1").getValue(0) == @fields.getField("val2").getValue(0)
      @fields.setField("out", res)
  
  class ThreeNodes.nodes.Smaller extends ThreeNodes.NodeBase
    @node_name = 'Smaller'
    @group_name = 'Conditional'
    
    set_fields: =>
      super
      @fields.addFields
        inputs:
          "val1" : {type: "Float", val: 0.0}
          "val2" : {type: "Float", val: 1.0}
        outputs:
          "out" : false
  
    compute: =>
      res = @fields.getField("val1").getValue(0) < @fields.getField("val2").getValue(0)
      @fields.setField("out", res)
  
  class ThreeNodes.nodes.Greater extends ThreeNodes.NodeBase
    @node_name = 'Greater'
    @group_name = 'Conditional'
    
    set_fields: =>
      super
      @fields.addFields
        inputs:
          "val1" : {type: "Float", val: 0.0}
          "val2" : {type: "Float", val: 1.0}
        outputs:
          "out" : false
  
    compute: =>
      res = @fields.getField("val1").getValue(0) > @fields.getField("val2").getValue(0)
      @fields.setField("out", res)
