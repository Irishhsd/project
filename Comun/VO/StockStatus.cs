using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    class StockStatus
    {
        [DataMember(EmitDefaultValue = false)]
        public int Id { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public int Status_Name { get; set; }

        [DataMember(EmitDefaultValue = false)]
        public string Key { get; set; }
    }
}
