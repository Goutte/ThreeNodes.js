define [
  'use!Underscore', 
  'use!Backbone',
  'order!threenodes/models/Node',
  'order!threenodes/utils/Utils',
], (_, Backbone) ->
  "use strict"
  
  $ = jQuery
  
  class ThreeNodes.nodes.PointLight extends ThreeNodes.NodeBase
    @node_name = 'PointLight'
    @group_name = 'Lights'
    
    set_fields: =>
      super
      @auto_evaluate = true
      @ob = new THREE.PointLight(0xffffff)
      
      @fields.addFields
        inputs:
          "color": {type: "Color", val: new THREE.Color(0xffffff)}
          "position": {type: "Vector3", val: new THREE.Vector3(0, 300, 0)}
          "intensity": 1
          "distance": 0
        outputs:
          "out": {type: "Any", val: @ob}
    
    remove: =>
      delete @ob
      super
    
    compute: =>
      @apply_fields_to_val(@fields.inputs, @ob)
      @fields.setField("out", @ob)
  
  class ThreeNodes.nodes.SpotLight extends ThreeNodes.NodeBase
    @node_name = 'SpotLight'
    @group_name = 'Lights'
    
    set_fields: =>
      super
      @auto_evaluate = true
      @ob = new THREE.SpotLight(0xffffff)
      
      @fields.addFields
        inputs:
          "color": {type: "Color", val: new THREE.Color(0xffffff)}
          "position": {type: "Vector3", val: new THREE.Vector3(0, 300, 0)}
          "target": {type: "Any", val: new THREE.Object3D()}
          "intensity": 1
          "distance": 0
          "castShadow": false
          "shadowCameraNear": 50
          "shadowCameraFar": 5000
          "shadowCameraFov": 50
          "shadowBias": 0
          "shadowDarkness": 0.5
          "shadowMapWidth": 512
          "shadowMapHeight": 512
        outputs:
          "out": {type: "Any", val: @ob}
    
    remove: =>
      delete @ob
      super
    
    compute: =>
      if @fields.getField("castShadow").getValue() != @ob.castShadow
        @trigger("RebuildAllShaders")
      @apply_fields_to_val(@fields.inputs, @ob)
      @fields.setField("out", @ob)
  
  class ThreeNodes.nodes.DirectionalLight extends ThreeNodes.NodeBase
    @node_name = 'DirectionalLight'
    @group_name = 'Lights'
    
    set_fields: =>
      super
      @auto_evaluate = true
      @ob = new THREE.DirectionalLight(0xffffff)
      
      @fields.addFields
        inputs:
          "color": {type: "Color", val: new THREE.Color(0xffffff)}
          "position": {type: "Vector3", val: new THREE.Vector3(0, 300, 0)}
          "intensity": 1
          "distance": 0
        outputs:
          "out": {type: "Any", val: @ob}
    
    remove: =>
      delete @ob
      super
    
    compute: =>
      @apply_fields_to_val(@fields.inputs, @ob)
      @fields.setField("out", @ob)
  
  class ThreeNodes.nodes.AmbientLight extends ThreeNodes.NodeBase
    @node_name = 'AmbientLight'
    @group_name = 'Lights'
    
    set_fields: =>
      super
      @auto_evaluate = true
      @ob = new THREE.AmbientLight(0xffffff)
      
      @fields.addFields
        inputs:
          "color": {type: "Color", val: new THREE.Color(0xffffff)}
          "position": {type: "Vector3", val: new THREE.Vector3(0, 300, 0)}
        outputs:
          "out": {type: "Any", val: @ob}
    
    remove: =>
      delete @ob
      super
    
    compute: =>
      @apply_fields_to_val(@fields.inputs, @ob)
      @fields.setField("out", @ob)
