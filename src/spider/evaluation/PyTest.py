import unittest
from src.intermediate_representation.sem2sparql import sem2SPARQL

class MyTestCase(unittest.TestCase):
    #def setUp(self) -> None:()

    def test_something(self):
        FilterNotExists= 'select ?t1_name where { ?t1 a dbo:stadium . ?t1 dbo:stadium\#name ?t1_name . ?t1 dbo:stadium\#stadium_id ?t1_stadium_id . Filter not exists {?t22 a dbo:concert . ?t22 dbo:concert\#stadium_id ?t22_stadium_id .     FILTER (?t1_stadium_id in (?t22_stadium_id)) .}    }'
        ResultFilterNotExists= sem2SPARQL.to_str()
        #
        self.assertEqual(FilterNotExists, ResultFilterNotExists)

if __name__ == '__main__':
    unittest.main()
