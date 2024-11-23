using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    class OrderItems
    {
        [DataMember(EmitDefaultValue = false)]
        public int Id { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public int Order_Id { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public int Product_Id { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public int Quantity { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public double Price { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public DateTime CreatedAt { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public DateTime UpdatedAt { get; set; }
    }
}
